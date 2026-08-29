#!/bin/bash

wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
chmod +x ./dotnet-install.sh
./dotnet-install.sh --channel 6.0 --runtime aspnetcore

if ! command -v fhir &> /dev/null
then
    dotnet tool install --global Firely.Terminal --version 3.1.0
fi

cd ~/.fhir/packages/fhir.r4.ukcore.stu1#1.0.0/package/
fhir login
for profile in ./UKCore-*; do fhir push $profile; fhir inflate; fhir snapshot; fhir save $profile; done