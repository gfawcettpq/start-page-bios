#!/bin/bash

json-server --watch /api/links.json --host 0.0.0.0 --port 3030 &

npm run serve
