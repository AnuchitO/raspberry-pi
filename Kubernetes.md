## Demo Scenario
1. Scale without config limit resources in manifest then got  **Error from server (NotFound): the server could not find the requested resource**

```bash
kubectl scale --replicas 10 -f app.yaml
kubectl scale --replicas=20 -f app.yaml
```

1. so that introduce resources limit in manifest app.yaml
