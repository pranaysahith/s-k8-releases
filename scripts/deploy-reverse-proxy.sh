#!/bin/bash


cd s-k8-proxy-rebuild/stable-src/
helm upgrade --install reverse-proxy chart/ || true

