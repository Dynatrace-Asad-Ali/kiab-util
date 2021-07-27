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
cd ~/kiab-util/examples/onboarding-carts
```
```$xslt
keptn create project dynatrace --shipyard=shipyard-quality-gates.yaml
```

### 2. Create tags in Dynatrace
### 3. Run keptn evaluation
```$xslt
keptn trigger evaluation --project=dynatrace --service=simplenodeservice --stage=quality-gate --timeframe=10m --labels=buildId=1,executionType=manual
```
