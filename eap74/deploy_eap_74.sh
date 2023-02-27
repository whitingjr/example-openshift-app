# note, username is from redhat dev portal: https://developers.redhat.com/
USERNAME=username@redhat.com
PASSWORD=yourpassword
EMAIL=email@redhat.com
# namespace is the NS in the openshift cluster, eg yourlogin-dev
NAMESPACE=yourlogin-dev
# auth token for oc login, you can get this from the 'Show login command' in the OpenShift Console
OPENSHIFT_URL=https://api.sandbox-m2.ll9k.p1.openshiftapps.com:6443
AUTH_TOKEN=sha256~ASDWEedsfwewefwefsdf
DOCKER_SERVER=registry.redhat.io
APP_NAME=first-responder-demo

HELM_CHARTS_URL=https://github.com/jbossas/eap-charts/releases/download/eap74-1.1.0/eap74-1.1.0.tgz
HELM_CHARTS_VERSION=eap74-1.1.0

# login to openshift
oc login --token=${TOKEN} --server=${OPENSHIFT_URL}

# create pull secret
oc create secret docker-registry eap-pull-secret --docker-server=${DOCKER_SERVER} --docker-username=${USERNAME} --docker-password=${PASSWORD} --docker-email=${EMAIL}

# fetch EAP 7.4 helm charts:
wget ${HELM_CHARTS_URL}/${HELM_CHARTS_VERSION}/${HELM_CHARTS_VERSION}.tgz

# helm install the app
helm install ${APP_NAME} ${HELM_CHARTS_VERSION}.tgz -f app.yaml

# to remove app
# #helm uninstall ${APP_NAME}
