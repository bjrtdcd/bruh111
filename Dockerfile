# Use the Windows base image
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Set working directory
WORKDIR c:/vnc

# Add VNC server installation files and batch script
ADD vnc_installer.exe c:/vnc/vnc_installer.exe
ADD start_vnc.bat c:/vnc/start_vnc.bat

# Install VNC server silently
RUN start /wait vnc_installer.exe /S /norestart

# Expose VNC port
EXPOSE 5900

# Install Localtunnel
RUN npm install -g localtunnel

# Start VNC server and Localtunnel
CMD ["cmd", "/k", "start_vnc.bat"]
