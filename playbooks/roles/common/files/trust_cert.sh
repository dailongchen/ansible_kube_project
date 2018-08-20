website=$1
port=$2
trust_cert_file_location=`curl-config --ca`

echo -n | openssl s_client -showcerts -connect $website:$port \
    2>/dev/null  | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p'  \
    >> $trust_cert_file_location