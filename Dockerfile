FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build

COPY . /app
WORKDIR /app/src/EnglishLearning.Gateway.Host
RUN dotnet publish -c Release -o /app/output

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS runtime
COPY --from=build /app/output /app/host
WORKDIR /app/host

ENV ASPNETCORE_ENVIRONMENT=Docker
ENV ASPNETCORE_URLS="http://*:5000"

ENTRYPOINT ["dotnet", "EnglishLearning.Gateway.Host.dll"]
