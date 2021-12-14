# MS SQL odbc driver
# https://docs.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver15

curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

#Debian 10
curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list

apt-get update -y

ACCEPT_EULA=Y apt-get install -y msodbcsql17 mssql-tools
