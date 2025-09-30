export APPS_JSON_BASE64=$(base64 -w 0 ./apps.json)
echo -n ${APPS_JSON_BASE64} | base64 -d 

docker buildx build \
  --build-arg "FRAPPE_PATH=https://github.com/frappe/frappe" \
  --build-arg "FRAPPE_BRANCH=version-15" \
  --build-arg "PYTHON_VERSION=3.11.6" \
  --build-arg "NODE_VERSION=20.19.2" \
  --build-arg "APPS_JSON_BASE64=$APPS_JSON_BASE64" \
  --tag erpnext_custom:v0.1 \
  --file images/custom/Containerfile .
