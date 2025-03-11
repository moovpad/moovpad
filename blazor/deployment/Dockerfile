FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

# the below paths assume the Dockerfile, .sln and csproj are placed in the same directory, at same level.
COPY MyProject.sln ./
COPY MyProject.csproj ./

RUN dotnet restore ./MyPorject.csproj
COPY . ./
RUN dotnet publish ./MyProject.csproj -c Release -o output
# this gives us the final path in the last line - /app/output/wwwroot

FROM nginx 
WORKDIR /app
EXPOSE 8080
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/output/wwwroot /usr/share/nginx/html
# the container-internal path /usr/share/nginx/html needs to match what we put into the nginx.conf file