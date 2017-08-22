# plutosdr-bsp

# PlutoSDR BSP build system based on buildroot

* Dependencies

1.Xilinx Vivado SDK : [link][1]

2.Linux development host
 ```bash
    sudo apt-get install git make u-boot-tools build-essential fakeroot libncurses5-dev libssl-dev ccache dfu-util mtools util-linux
 ```
 
 3.genimage tool : [link][2]
 
 
* Build Instructions
 ```bash
    git clone https://github.com/PlutoSDR/plutosdr-bsp.git
    cd plutosdr-bsp
    export CROSS_COMPILE=arm-xilinx-linux-gnueabi-
    export PATH=$PATH:/opt/Xilinx/SDK/2017.2/gnu/arm/lin/bin
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


  [1]: https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/embedded-design-tools.html
  [2]: http://public.pengutronix.de/software/genimage/
