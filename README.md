# plutosdr-bsp

# PlutoSDR BSP build system based on buildroot

* Dependencies
* 1.Xilinx Vivado SDK
* 2.Linux development host
 ```bash
    sudo apt-get install git make u-boot-tools build-essential fakeroot libncurses5-dev libssl-dev ccache dfu-util
 ```
 

* Build Instructions
 ```bash
    git clone https://github.com/PlutoSDR/plutosdr-bsp.git
    cd plutosdr-bsp
    export CROSS_COMPILE=arm-xilinx-linux-gnueabi-
    export PATH=$PATH:/opt/Xilinx/SDK/2016.2/gnu/arm/lin/bin
    make git-update-all
    make update
    make
 
 ```
 
 * Updating your local repository 
 ```bash 
    make git-pull
  ```
  
   * Updating buildroot config  (*zynq_pluto_defconfig* file)
 ```bash 
    make update-buildroot-config
  ```
  
   * Updating buildroot third-party packages  (*packages* directory)
 ```bash 
    make update-buildroot-packages
  ```