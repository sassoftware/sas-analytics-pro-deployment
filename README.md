This project is no longer under active development and was archived on 2025-01-07.

# Deploy A-Pro, like a Pro!

Now that SAS R&D has come out with container-manager, a utility which eases the deployment process for SAS Analytics Pro (and other single container offerings in future), let us take this automation even further!

## What does this example do?
1. Ask the user for the Order number, and preferred cadence releases (name and version)
2. Goes to my.sas.com and retrieves the deployment assets required (certificates and licence)
3. Uses the above assets and the container-manager utility to deploy Analytics Pro.


### Important : This is only an example.

container-manager is a utility which is provided and supported by SAS R&D.  This repository is meant to only serve as an example of how to take this automation even further, for the really indolent amongst us.  **Do not consider this repo as an official product.**  At the same time, feel free to modify / break / ignore.

Also, contact the appropriate SAS channels (such as support.sas.com and communities.sas.com) for any questions regarding the container-manager utility.  Feel free to raise questions and contribute your take on this example.  Refer the [Support](./SUPPORT.md) and [Contributing](./CONTRIBUTING.md).

### Important :  The motivation is "EVERYTHING AS CODE"
The idea is to see how far we can go with a message that the SAS Analytics Pro(r)  (single container / single user scenarios) deployment experience can be simplified to such an extent that deployment, work, and uninstall can happen without leaving a trace, on a system.


## How do you use this?
### Windows version only

#### Pre-requisites 
Imagine that you have a Windows laptop with no trace of anything connected to A-pro (well, except your existing SAS programs).

1. Download the Windows binary of container-manager from [here.](http://support.sas.com/installation/viya/4/sas-container-manager/wx6/containermgr-windows.zip)
2. Add a path to the container-manager binary in your system environment variables (this link shows an [example](https://www.architectryan.com/2018/08/31/how-to-change-environment-variables-on-windows-10/))
3. Make sure Docker is started and running on your machine.
4. Replace line #7 of your [getToken.ps1](./getToken.ps1) file with your Client ID and secret (you can obtain this from the [API portal](https://apiportal.sas.com/) or from the Orders page in [my.sas.com](my.sas.com)) 


#### Deployment steps
1. Clone the repository to a location where you wish to deploy the same.
```
git clone <..deployapro.git>
cd deployapro

```

2. Create an empty data (/data) directory. This step will be further simplified in future.

```
mkdir data
```
3. Run the deployment PowerShell script.

```
PS <your deployment location\deployapro> .\deployapro.ps1
```
At the prompt, provide your Order number, preferred cadence and version.

The deployment should start and complete with a running docker.


## Contributing

We welcome your contributions! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on how to submit contributions to this project. 

## License

This project is licensed under the [Apache 2.0 License](LICENSE).



#### Future enhancements planned

1. Linux version
2. User can specify a location for their /data directory
3. User can specify git repositories which can be loaded into /data directory once deployment is done.
4. Scripted graceful shutdowns and container removals
5. Additional validations

