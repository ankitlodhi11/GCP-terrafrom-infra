#!/bin/bash

set -e

apt-get update
apt-get install -y \
    nginx \
    git \
    curl \
    wget \
    unzip \
    jq \
    ca-certificates \
    python3-pip
    systemctl enable nginx
    systemctl start nginx

cat > /var/www/html/index.html <<'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>My App</title>
</head>
<body>
    <h1>Welcome to My App</h1>
    <p>This is a simple HTML page.</p>
</body>
</html>
EOF