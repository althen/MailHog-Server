package smtp

import (
	"crypto/tls"
	"io"
	"log"
	"net"

	"github.com/mailhog/MailHog-Server/config"
)

func Listen(cfg *config.Config, exitCh chan int) *net.TCPListener {
	log.Printf("[SMTP] Binding to address: %s\n", cfg.SMTPBindAddr)
	log.Printf("[SMTP] ssl %v", cfg.SmtpSsl)

	ln, err := net.Listen("tcp", cfg.SMTPBindAddr)
	if err != nil {
		log.Fatalf("[SMTP] Error listening on socket: %s\n", err)
	}
	defer ln.Close()

	if cfg.SmtpSsl {
		cert, err := tls.LoadX509KeyPair(cfg.SmtpCert, cfg.SmtpKey)
		if err != nil {
			log.Fatalf("[SMTP] LoadX509KeyPair err:%v", err)
		}
		ln = tls.NewListener(ln, &tls.Config{
			Certificates: []tls.Certificate{cert},
		})
	}

	for {
		conn, err := ln.Accept()
		if err != nil {
			log.Printf("[SMTP] Error accepting connection: %s\n", err)
			continue
		}

		if cfg.Monkey != nil {
			ok := cfg.Monkey.Accept(conn)
			if !ok {
				conn.Close()
				continue
			}
		}

		go Accept(
			conn.RemoteAddr().String(),
			io.ReadWriteCloser(conn),
			cfg.Storage,
			cfg.MessageChan,
			cfg.Hostname,
			cfg.Monkey,
		)
	}
}
