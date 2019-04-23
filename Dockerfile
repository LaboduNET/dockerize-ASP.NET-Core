#This is the base aspnet core runtime container
FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 40456
#EXPOSE 44383

#Multi-stages Build 
#1-Restore and build the project in release configuration
FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /src
COPY WebSite.csproj ./
RUN dotnet restore /WebSite.csproj
COPY . .
WORKDIR /src/
RUN dotnet build WebSite.csproj -c Release -o /app

#2-Pack the project for deployement (ready to publish)
FROM build AS publish
RUN dotnet publish WebSite.csproj -c Release -o /app

 #3-Create the resulting image to run the built project
FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "WebSite.dll"]
