## Create Dynatrace Token
Create Dynatrace API Token with the following permissions:
![Image of API V2](https://github.com/Dynatrace-Asad-Ali/keptn-in-a-box/blob/master/images/APIV2.png)
![Image of API V1](https://github.com/Dynatrace-Asad-Ali/keptn-in-a-box/blob/master/images/APIV1.png)

## Kept-in-a-box Installation
#### 1. Log in into  your Ubuntu image
```$xslt
git clone https://github.com/Dynatrace-Asad-Ali/kiab-util.git
```
```$xslt
cd kiab-util
```

#### 2. Change permissions

```$xslt
chmod +x install.sh
```

```$xslt
chmod +x postInstall.sh
```
```$xslt
chmod +x keptn-in-a-box.sh
```

#### 3. Execute the files.
```$xslt
./install.sh
```

```$xslt
sudo bash -c './keptn-in-a-box.sh &'
```
```$xslt
less +F /tmp/kiab-install.log
```

#### 4. Setup up kubectl
```$xslt
kubectl
```

#### 5. Logout and login again

#### 6. Run post install script
```$xslt
cd kiab-util
./postInstall.sh
```

## Create projects and services in Keptn

### 1. Create a simple project
```$xslt
cd ~/kiab-util/examples/hello-service
```

```$xslt
keptn create project dynatrace --shipyard=./shipyard-quality-gates.yaml
```

```$xslt
kubectl create -f hello.yaml
```

```$xslt
kubectl expose deployment hello-world --type=NodePort --name=example-service
```
```$xslt
kubectl get svc
```
```$xslt
wget http://localhost:<PORT-NUMBER>
```

### 2. Create tags in Dynatrace
#### Add 2 tags to the Hello-Service
a. keptn_managed

b. keptn_service=helloservice

### 3. Run keptn evaluation
```$xslt
keptn add-resource --project=dynatrace --resource=sli-config-dynatrace.yaml --resourceUri=dynatrace/sli.yaml
```

```$xslt
keptn add-resource --project=dynatrace --stage=quality-gate --service=helloservice --resource=slo-quality-gates.yaml --resourceUri=slo.yaml
```
```$xslt
keptn configure monitoring dynatrace --project=dynatrace
```

```$xslt
keptn trigger evaluation --project=dynatrace --service=helloservice --stage=quality-gate --timeframe=10m --labels=buildId=1,executionType=manual
```

## Create multi-stage project

### 1. Import dashboard to Dynatrace
"KQG;project=dynatrace;service=journeyservice;stage=quality-gate.json"

### 1. Create a simple project
```$xslt
cd ~/kiab-util/examples/onboarding-carts
```

```$xslt
keptn create project sockshop --shipyard=shipyard.yaml
```

```$xslt
keptn onboard service carts --project=sockshop --chart=./carts
```

```$xslt
keptn add-resource --project=sockshop --stage=dev --service=carts --resource=jmeter/basiccheck.jmx --resourceUri=jmeter/basiccheck.jmx
```

```$xslt
keptn add-resource --project=sockshop --stage=staging --service=carts --resource=jmeter/load.jmx --resourceUri=jmeter/load.jmx
```

```$xslt
keptn add-resource --project=sockshop --service=carts --stage=dev --resource=dynatrace.conf.yaml --resourceUri=dynatrace/dynatrace.conf.yaml
```

```$xslt
keptn onboard service carts-db --project=sockshop --chart=./carts-db
```

```$xslt
keptn configure monitoring dynatrace --project=sockshop
```

```$xslt
keptn trigger evaluation --project=dynatrace --service=helloservice --stage=quality-gate --timeframe=10m --labels=buildId=1,executionType=manual
```

