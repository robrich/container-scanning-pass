FROM mcr.microsoft.com/dotnet/core/sdk:3.1-alpine

WORKDIR /src
COPY ./ContainerScanning.csproj .
RUN dotnet restore

COPY . .
RUN dotnet build -c Release
RUN dotnet publish -c Release -o /dist

WORKDIR /dist
ENV ASPNETCORE_ENVIRONMENT Production
ENV ASPNETCORE_URLS http://+:80
EXPOSE 80

CMD ["dotnet", "ContainerScanning.dll"]
