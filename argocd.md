# ArgoCD

## Installation

https://argo-cd.readthedocs.io/en/stable/getting_started/#1-install-argo-cd


ArgoCD
1.รันคำสั่งสร้าง Namespace

kubectl create namespace argocd
2.รันคำสั่งติดตั้ง ArgoCD

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
3.หารหัสผ่าน ArgoCD ของ admin ไว้ก่อน

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
4.Forword Port เพื่อใช้งาน ArgoCD

kubectl port-forward svc/argocd-server -n argocd 8080:443
