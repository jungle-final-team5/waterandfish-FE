#![Uploading 스크린샷 2025-07-29 오후 9.51.25.png…]()
 수어지교: 인터랙티브 수어 학습 플랫폼

수어지교는 실시간 모션 인식과 즉각적인 피드백을 통해 누구나 쉽고 재미있게 수어(한국 수화)를 배울 수 있는 웹 기반 학습 플랫폼입니다.

## 🏆 주요 특징

- **실시간 웹캠 모션 인식**: MediaPipe Holistic을 활용한 포즈와 양손을 인식합니다.
- **즉각적 피드백**: 웹소켓을 통해 연결된 모델의 판정을 바탕으로, 실시간 정답/오답에 대한 피드백을 받아보세요.
- **뱃지/연속 학습 보상**: 뱃지, 연속 학습(스트릭) 시스템으로 꾸준히 학습할 동기를 얻어봐요.
- **검색 및 추천**: 원하는 수어 단어를 검색해서 학습하세요. 직접 필요한 것을 찾아서 지식을 쌓아보세요.
- **반응형 UI**: Tailwind CSS, shadcn-ui 기반의 현대적이고 직관적인 디자인으로 구성했어요.

---

## 📂 폴더 구조

```
src/
  pages/ # 주요 페이지(홈, 학습, 퀴즈, 지화 학습, 프로필 등)
  components/ # 재사용 UI 컴포넌트 및 모달
  ui/ # 기본 UI 컴포넌트 (버튼, 카드, 슬라이더 등)
  draw/ # 캔버스 드로잉 관련 컴포넌트
  hooks/ # 커스텀 훅 (학습 데이터, 뱃지, 스트릭, 미디어파이프 등)
  services/ # WebSocket, MediaPipe 등 외부 서비스 연동
  contexts/ # 글로벌 상태 관리 (WebSocket, 사용자 설정 등)
  types/ # 타입 정의
  lib/ # API, 유틸 함수
  public/ # 정적 파일(이미지, 모델 등)
```

---

## 🖥️ 주요 페이지 및 기능

- **메인(홈) 페이지**:  
  - 인사/검색창/진도 배치
- **학습 페이지**:  
  - 각 챕터별 수어 학습
  - 실시간 웹캠 인식, 예시 애니메이션, 정답 피드백
- **퀴즈 세션**:  
  - 원형 타이머와 함께 제한 시간 내 수어 동작 인식
  - 실시간 정확도 측정 및 결과 피드백
- **지화 학습**:  
  - 한글 자음/모음 지화 학습 및 퀴즈 모드
  - 손 모양 인식을 통한 실시간 피드백
- **프로필/설정**:  
  - 닉네임, 뱃지, 연속 학습 현황 등 확인
  - 학습 통계 및 진행 상황 확인
- **관리자(Admin)**:  
  - (관리자용) 데이터 관리 기능


---

## ⚙️ 설치 및 실행 방법

### 1. 의존성 설치

```bash
git clone <레포지토리 주소>
cd team5-waterandfish-FE
npm install
```

### 2. 개발 서버 실행

```bash
npm run dev
```
- 기본적으로 [Vite](https://vitejs.dev/) 개발 서버가 실행됩니다.
- 브라우저에서 `http://localhost:5173` 접속

### 3. 환경 변수

- API 서버, MediaPipe 서버 등과 연동 시 `.env` 파일에 필요한 환경변수를 설정해야 할 수 있습니다.

---

## 🛠️ 기술 스택

- **프론트엔드**: React, TypeScript, Vite
- **스타일/UI**: Tailwind CSS, shadcn-ui, Ant Design 일부
- **AI/모션 인식**: MediaPipe Holistic, WebSocket
- **상태관리/비동기**: React Query, Context API, 커스텀 훅
- **테스트**: Jest, Cypress (e2e)
- **기타**: lodash, axios 등

---

## 🧩 주요 컴포넌트

- `SlideScale` : 수어 단어 슬라이드 및 사용자 인터랙션 컴포넌트
- `QuizTimer`: 원형 타이머 UI 컴포넌트
- `VideoInput`: 웹캠 입력 및 MediaPipe 연동 컴포넌트
- `FeedbackDisplay`: 실시간 피드백 UI 컴포넌트
- `SessionHeader`: 학습 세션 헤더 컴포넌트
- `LetterDisplay`: 지화 학습용 디스플레이 컴포넌트
- `StreamingControls`: 웹소켓 연결 상태 및 제어 컴포넌트

---

## 🧪 테스트

- `cypress/e2e/` : E2E 테스트 시나리오
- `src/pages/*.test.tsx`, `src/components/*.test.tsx` : 단위 테스트

```bash
npm run test
# 또는
npx cypress open
```

---

## 📝 기여 방법

1. 이슈/기능 제안 등록 (GitHub Issues)
2. Fork & PR 요청
3. 코드 작성 시 Prettier, ESLint 규칙 준수
4. 커밋 메시지 컨벤션 지키기

---

## 📄 라이선스

- 본 프로젝트는 크래프톤 정글 8기 307-5팀 소유의 오픈소스/비영리 목적 프로젝트입니다.
- 라이선스 및 상업적 이용 관련 문의는 팀장에게 연락 바랍니다.

---

## 📚 참고 문서

- [MediaPipe 통합 가이드](./MEDIAPIPE_INTEGRATION.md)
- [EC2 MediaPipe 디버깅 가이드](./EC2_MEDIAPIPE_DEBUGGING.md)

---

추가로 궁금한 점이나 개선 요청이 있다면 언제든 이슈로 남겨주세요!
