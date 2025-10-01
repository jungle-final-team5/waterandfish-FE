# waterandfish-FE Kubernetes Manifests

## Prerequisites
- Container image published: `your-registry/waterandfish-fe:latest` (update in `k8s/deployment.yaml`)
- NGINX Ingress Controller installed
- Optional: cert-manager with a `Certificate` provisioning the `waterandfish-tls` secret

## Build and Push Image
```bash
# from repo root
docker build -t registry-waterandfish.kr.ncr.ntruss.com/waterandfish-fe:latest .
docker push registry-waterandfish.kr.ncr.ntruss.com/waterandfish-fe:latest
```

## Apply Manifests
```bash
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/configmap-nginx.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/ingress.yaml
```

## Notes
- The pod Nginx config (ConfigMap) handles SPA routing and proxies `/api` and websocket paths to the existing backend at `13.209.142.150`.
- TLS terminates at the Ingress; the pod listens on port 80 only.
- Set `replicas` in `k8s/deployment.yaml` as desired. 


```bash
kubectl -n waterandfish set image deploy/waterandfish-fe frontend=registry-waterandfish.kr.ncr.ntruss.com/waterandfish-fe:latest
kubectl -n waterandfish rollout status deploy/waterandfish-fe
kubectl -n waterandfish get po
```