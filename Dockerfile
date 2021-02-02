FROM mcr.microsoft.com/dotnet/sdk:5.0-focal AS build

COPY . /app
WORKDIR /app/src/EnglishLearning.Gateway.Host
RUN dotnet publish -c Release -o /app/output

FROM mcr.microsoft.com/dotnet/aspnet:5.0-focal AS runtime
COPY --from=build /app/output /app/host
WORKDIR /app/host

#ENV ASPNETCORE_ENVIRONMENT=Docker
ENV ASPNETCORE_ENVIRONMENT=MixedDocker
ENV ASPNETCORE_URLS="http://*:5000"

ENTRYPOINT ["dotnet", "EnglishLearning.Gateway.Host.dll"]
