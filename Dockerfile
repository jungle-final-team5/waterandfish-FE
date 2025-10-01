# 1단계: 빌드
FROM node:20.14.0-slim AS builder
WORKDIR /app

# npm 캐시 설정 및 의존성 설치
COPY package*.json ./

# TODO: 현재 .env.production은 비어있음
COPY .env.production .env.production 

# 모든 의존성 설치 (빌드에 devDependencies 필요)
RUN npm ci --no-audit --no-fund

# 소스 코드 복사 및 빌드
COPY . .
RUN npm run build

# 2단계: 정적 파일 서빙
FROM nginx:1.25.3-alpine
COPY --from=builder /app/dist /usr/share/nginx/html

# COPY ssl/certificate.crt /etc/nginx/ssl/certificate.crt
# COPY ssl/private.key /etc/nginx/ssl/private.key
# COPY ssl/ca_bundle.crt /etc/nginx/ssl/ca_bundle.crt

# ✅ SPA 라우팅용 Nginx 설정 필요 시 아래 줄 활성화
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
