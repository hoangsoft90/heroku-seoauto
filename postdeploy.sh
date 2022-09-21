#!/bin/bash
#$DATABASE_URL
cmd=$(node "" -- <<-'EOF'
function parseUri(uri) {
    const { URL } = require('url');
  const {
    protocol = '',
    username: user,
    password,
    port,
    hostname: host,
    pathname = ''
  } = new URL(uri)
  return {
    scheme: protocol.replace(':', ''),
    user,
    password,
    host,
    port,
    database: pathname.replace('/', '')
  }
}
var p=parseUri(process.env.DATABASE_URL);
//-W 
console.log(`PGPASSWORD=${p.password} psql -h ${p.host} -d ${p.database} -U ${p.user} -f db.sql`);
EOF
);
$cmd || true
#psql $args -f db.sql
