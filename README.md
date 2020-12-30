# Linux Utils
Comandos uteis para ambientes Linux.

##### Buscar texto em arquivos
`grep -rnw '/path/to/search' -e 'pattern'`

##### Porcentagem de uso do disco
`df -h | grep sda1 | awk '{print $5}'`

##### Enviar conteudo de arquivo por e-mail

```bash
MAIL_HOST=smtp.domain.com
MAIL_USER=email_user
MAIL_PASS=email_pass

title="E-mail Title <youremailaddress@domain.com>"
dest="destemail@domain.com"
subj="Subject"

sendemail -f $title -t $dest -u $subj -s $MAIL_HOST -o tls=yes -xu $MAIL_USER -xp $MAIL_PASS -o message-file=/path/to/file
```
