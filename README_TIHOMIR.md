Workflow labels are created - **Build, Test, Deploy**. On Pull request from **tihomirIliev-patch-1** to **master** branch with label selected the following actions are triggered:<br><br>
**Build** - Docker image is build from the Dockerfile and pushed to Docker Hub.<br><br>
**Test** - The image with tag devnet_hardhat is runned and hardhat tests are triggered on it.<br><br>
**Deploy** - Docker compose is used to run the image created in build. Test smart contract is deployed on the devnet. New image from the running container is build with tag - **devnet_hardhat**<br><br>

Note: The actions in Steps Deploy and Test are examples.<br> Upon running the devnet network from the image the hardhat project does not want to connect to it - **UND_ERR_SOCKET - SocketError: other side closed** <br><br>I have tried to set custom local network with genesis file with the go-ethereum image or with different geth installation, but with no success: <br>With go-ethereum the genesis file seemed like it was not getting imported.<br>With different geth installation, the custom network was created but on Smart contract deploying error about the socket connection appeared - **SocketError: other side closed**
<br><br>
**Deployment to Azure**<br>
Simple terraform script is set to create **AKS cluster** and deploy the **devnet_hardhat** image to it along with one service.<br> SSH and RBAC parts of the setup are skipped.<br>First log in to Azure by executing **az login**. <br>The synchronizing to Azure information is skipped in terraform, as terraform will assume it from **az login** (This will be depricated in the future)<br><br>  
Navigate to terraform folder and execute **terraform init -> terraform plan -> terraform apply** commands. After completion **kubeconfig** file will be created. It can be used to interact with the cluster with **kubectl** (kubectl have to be instailled on the machine). 
<br><br>Increment the Counter value by one to simulate change so pull request can be available.<br><br>
Counter 2

