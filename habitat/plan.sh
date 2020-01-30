pkg_origin=j5
pkg_name=jhonn5isalive
pkg_version="0.2.0"
pkg_maintainer="The K3 Maintainers <adam.mccartney@k3btg.com>"
pkg_upstream_url=https://github.com/amccartneyk3/habitat-example-plans
pkg_scaffolding=core/scaffolding-node

declare -A scaffolding_env

 # Define path to config file
scaffolding_env[APP_CONFIG]="{{pkg.svc_config_path}}/config.json"
