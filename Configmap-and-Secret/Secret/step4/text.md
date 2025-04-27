> A Secret is an object that contains a small amount of sensitive data such as a password, a token, or a key. However, by default, Kubernetes secret only **encode** the values and **don't have any encryption**

1. Create a Secret named `creditcard` with content `cardnumber=12345678` and `pin=1234`
2. Create Secret name `token` by apply existing yaml file at `/tmp/secret.yaml`
3. Retrieve value from `creditcard` and save the encoded value into `/tmp/answer1`
4. Retrieve value from `token`, then save the decoded into `/tmp/answer2`



Docs:
https://kubernetes.io/docs/concepts/configuration/secret/#uses-for-secrets


<br>
<details><summary>Tip</summary>
<br>

```plain
# Create secret
kubectl create secret -h

# Apply yaml file from
kubectl apply -f

# To base64 decode
echo "some encode value" | base64 -d 

# Create and write into a file
echo "something" > <path to a file>

# Append to a file
echo "something" >> <path to a file>
```

</details>


<br>
<details><summary>Solution</summary>
<br>

```plain
kubectl create secret generic creditcard --from-literal=cardnumber=12345678 --from-literal=pin=1234

kubectl apply -f /tmp/secret.yaml

# Check values inside secret
kubectl get secret token -oyaml

echo "MTIzNA==" >  /tmp/answer1 
echo "MTIzNDU2Nzg=" >>  /tmp/answer1 
echo "a8FbGk3LmN7XpTqZ" >  /tmp/answer2 

```

</details>
