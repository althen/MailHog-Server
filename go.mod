module github.com/althen/MailHog-Server

go 1.12

require (
	github.com/bmizerany/assert v0.0.0-20160611221934-b7ed37b82869 // indirect
	github.com/gorilla/context v1.1.1 // indirect
	github.com/gorilla/mux v1.7.3 // indirect
	github.com/gorilla/pat v1.0.1
	github.com/gorilla/websocket v1.4.1
	github.com/ian-kent/envconf v0.0.0-20141026121121-c19809918c02
	github.com/ian-kent/go-log v0.0.0-20160113211217-5731446c36ab
	github.com/ian-kent/goose v0.0.0-20141221090059-c3541ea826ad
	github.com/ian-kent/linkio v0.0.0-20170807205755-97566b872887
	github.com/kr/pretty v0.1.0 // indirect
	github.com/mailhog/MailHog v1.0.0
	github.com/mailhog/MailHog-Server v1.0.0
	github.com/mailhog/MailHog-UI v1.0.0
	github.com/mailhog/data v1.0.0
	github.com/mailhog/http v1.0.0
	github.com/mailhog/smtp v1.0.0
	github.com/mailhog/storage v1.0.0
	github.com/philhofer/fwd v1.0.0 // indirect
	github.com/smartystreets/goconvey v1.6.4
	github.com/stretchr/testify v1.4.0 // indirect
	github.com/t-k/fluent-logger-golang v1.0.0 // indirect
	github.com/tinylib/msgp v1.1.0 // indirect
	gopkg.in/mgo.v2 v2.0.0-20190816093944-a6b53ec6cb22 // indirect
)

//replace github.com/mailhog/MailHog-Server => github.com/althen/MailHog-Server v1.0.1-0.20191128032631-cf71904c9e84
replace github.com/mailhog/MailHog-Server => github.com/althen/MailHog-Server v1.0.1-0.20191128052428-2f22c3f71f1e
