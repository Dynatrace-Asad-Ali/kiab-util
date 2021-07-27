## Create Dynatrace Token
Create Dynatrace API Token with the following permissions:
![Image of API V2](https://github.com/Dynatrace-Asad-Ali/keptn-in-a-box/blob/master/images/APIV2.png)
![Image of API V1](https://github.com/Dynatrace-Asad-Ali/keptn-in-a-box/blob/master/images/APIV1.png)
### Run it in an available machine  (manually)

## Kept-in-a-box Installation
#### 1. Log in into  your Ubuntu image
```$xslt
git clone https://github.com/Dynatrace-Asad-Ali/kiab-util.git
```
```$xslt
cd kiab-util
```

#### 2. Download few shell scripts

```$xslt
curl -O https://raw.githubusercontent.com/Dynatrace-Asad-Ali/keptn-in-a-box/master/install.sh
chmod +x install.sh
```

```$xslt
curl -O https://raw.githubusercontent.com/Dynatrace-Asad-Ali/keptn-in-a-box/master/keptn-in-a-box.sh
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
./postInstall.sh
```
