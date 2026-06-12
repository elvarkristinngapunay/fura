#!/bin/bash
# Ræsir Fura-vefinn á http://localhost:4567 og opnar hann í vafranum.
# Tvísmelltu á þessa skrá. Lokaðu Terminal-glugganum til að stöðva vefinn.
cd "$(dirname "$0")"
# Ef þjónn er þegar í gangi á 4567, opnaðu bara vafrann
if curl -s -o /dev/null --max-time 2 http://localhost:4567/index.html; then
  open "http://localhost:4567"
  echo "Vefurinn var þegar í gangi — opnaði í vafra."
  exit 0
fi
echo "Ræsi Fura-vefinn á http://localhost:4567 ..."
python3 -m http.server 4567 --bind 127.0.0.1 &
SERVER_PID=$!
sleep 1
open "http://localhost:4567"
echo ""
echo "Vefurinn er kominn í loftið. LOKAÐU EKKI þessum glugga á meðan þú vinnur."
echo "Til að stöðva: lokaðu þessum Terminal-glugga."
wait $SERVER_PID
