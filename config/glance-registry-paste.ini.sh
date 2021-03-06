#!/usr/bin/env bash

cp /etc/glance/glance-registry-paste.ini /etc/glance/glance-registry-paste.ini.bak

cat <<EOF > /etc/glance/glance-registry-paste.ini
# Use this pipeline for no auth - DEFAULT
[pipeline:glance-registry]
pipeline = unauthenticated-context registryapp

# Use this pipeline for keystone auth
[pipeline:glance-registry-keystone]
pipeline = authtoken context registryapp

# Use this pipeline for authZ only. This means that the registry will treat a
# user as authenticated without making requests to keystone to reauthenticate
# the user.
[pipeline:glance-registry-trusted-auth]
pipeline = context registryapp

[app:registryapp]
paste.app_factory = glance.registry.api.v1:API.factory

[filter:context]
paste.filter_factory = glance.api.middleware.context:ContextMiddleware.factory

[filter:unauthenticated-context]
paste.filter_factory = glance.api.middleware.context:UnauthenticatedContextMiddleware.factory

[filter:authtoken]
paste.filter_factory = keystoneclient.middleware.auth_token:filter_factory
auth_host = controller
admin_user = glance
admin_tenant_name = service
admin_password = KEYSTONE_GLANCE_PASSWORD 
EOF

