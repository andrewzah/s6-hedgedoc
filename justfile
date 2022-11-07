alpine_version := '3.15'
hedgedoc_version := '1.9.6'

build hv=hedgedoc_version av=alpine_version:
  docker build . \
    --build-arg "ALPINE_VERSION={{av}}" \
    --build-arg "HEDGEDOC_VERSION={{hv}}" \
    -t "andrewzah/hedgedoc:{{hv}}-alpine{{av}}"
