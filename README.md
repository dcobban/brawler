# brawler

This project is an initial test for using the Pumex graphics library and has currently only been tested on windows (though I hope to support all pumex platforms in the future)

#### Minimal requirements for Win64

[Vulkan v1.97.0](https://vulkan.lunarg.com/sdk/home#sdk/downloadConfirm/1.1.97.0/windows/VulkanSDK-1.1.97.0-Installer.exe)
	This is the current version the code is tested against new/older versions may also function
	
[Git for Windows](https://github.com/git-for-windows/git/releases/download/v2.21.0.windows.1/Git-2.21.0-64-bit.exe)
	Currently all automated git actions are performed by cmake so install GIT bash/GUI/Shell integration as desired

[CMake v3.14](https://github.com/Kitware/CMake/releases/download/v3.14.1/cmake-3.14.1-win64-x64.msi) 
	The [cmake downloads page](https://cmake.org/download/) requests all versions earlier than 3.4 should be uninstalled first.

[Visual Studio 2019 Community Edition](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Community&rel=16)
	If another version of of visual studio is desired modify 'build.bat' to generate those projects with cmake alternatively

