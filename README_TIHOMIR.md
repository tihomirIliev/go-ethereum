Workflow labels are created - **Build, Test, Deploy**. On Pull request from **tihomirIliev-patch-1** to **master** branch with label selected the following actions are triggered:<br><br>
**Build** - Docker image is build from the Dockerfile and pushed to Docker Hub.<br><br>
**Test** - The image with tag devnet_hardhat is runned and hardhat tests are triggered on it.<br><br>
**Deploy** - Docker compose is used to run the image created in Build step. Test smart contract is deployed on the devnet2. New images from the running containers are build with corresponding tags<br>

Note: After the deployment of the contract three images are created instead of one.<br><br>
**Deployment to Azure**<br>
First log in to Azure by executing **az login**. <br>The synchronizing to Azure information is skipped in terraform, as terraform will assume it from **az login** (This will be depricated in the future)<br><br>  
Navigate to terraform folder and execute **terraform init -> terraform plan -> terraform apply** commands. After completion **kubeconfig** file will be created. After the cluster is created terraform apply has to be executed again, because it does not wait for the cluster complition and executes the deployment before the kubeconfig files is created.
<br><br>Increment the Counter value by one to simulate change so pull request can be available.<br><br>
Counter 3

