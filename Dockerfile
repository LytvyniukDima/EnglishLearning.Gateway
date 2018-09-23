FROM microsoft/dotnet:2.1-sdk AS build

COPY . /app
WORKDIR /app/EnglishLearning.Gateway.Host
RUN dotnet publish -c Release -o /app/output

FROM microsoft/dotnet:2.1-aspnetcore-runtime AS runtime
COPY --from=build /app/output /app/host
WORKDIR /app/host

ENV ASPNETCORE_ENVIRONMENT=Docker
ENV ASPNETCORE_URLS="http://*:5000"

ENTRYPOINT ["dotnet", "EnglishLearning.Gateway.Host.dll"]
