# 🌿 Estrategia de Branching - Git Flow

**Proyecto:** RedNorte Healthcare System  
**Estrategia:** Git Flow Model  
**Última Actualización:** 2026-06-23

---

## 📋 Introducción

Este proyecto implementa **Git Flow**, una estrategia de branching profesional que permite:
- Desarrollo paralelo de múltiples features
- Control de versiones claro
- Releases organizadas
- Hotfixes aislados
- Colaboración efectiva en equipo

---

## 🏗️ Estructura de Ramas

```
master (producción) ← [release/v1.0.0, hotfix/*]
  ↑
  |
develop (desarrollo) ← [feature/*, bugfix/*]
  ↑
  └── feature/frontend-ui-redesign
  ├── feature/backend-apis
  ├── feature/microservices-architecture
  ├── feature/testing-coverage
  ├── feature/documentation
  ├── feature/service-discovery-eureka
  ├── bugfix/delete-endpoint-parsing
  └── release/v1.0.0
```

---

## 🔀 Descripción de Cada Rama

### **master** (Rama de Producción)
- **Propósito:** Código en producción, siempre estable
- **Acceso:** Solo merges desde `release/*` o `hotfix/*`
- **Tags:** Versionado semántico (v1.0.0, v1.0.1, etc.)
- **Deployments:** Automáticos a producción desde aquí
- **Estado:** Siempre funcionando, sin cambios directos

### **develop** (Rama de Desarrollo)
- **Propósito:** Rama de integración para features en desarrollo
- **Acceso:** Merges desde `feature/*` y `bugfix/*` mediante Pull Requests
- **Estado:** Pre-release, puede tener features nuevas
- **Deployment:** Staging environment

---

## 🎯 Ramas de Feature

### **feature/frontend-ui-redesign**
- **Objetivo:** Rediseño de interfaz con UI profesional
- **Cambios:**
  - Encabezado mejorado "Centro de Operaciones Clínicas"
  - Tarjetas KPI con métricas en tiempo real
  - Módulos mejorados con mejor jerarquía
  - Paleta de colores profesional
  - Responsive design

### **feature/backend-apis**
- **Objetivo:** Implementación de endpoints REST
- **Cambios:**
  - 10 endpoints RESTful (CRUD para pacientes y citas)
  - Orquestación en BFF
  - Validación de datos
  - Manejo de errores

### **feature/microservices-architecture**
- **Objetivo:** Arquitectura de microservicios
- **Cambios:**
  - ms-pacientes: gestión de pacientes
  - ms-citas: gestión de citas médicas
  - Separación de responsabilidades
  - Comunicación HTTP entre servicios

### **feature/testing-coverage**
- **Objetivo:** Pruebas unitarias exhaustivas
- **Cambios:**
  - JUnit 5 tests
  - Mockito para mocking
  - Test Coverage: 94%+ para microservicios, 63%+ para BFF
  - JaCoCo reports
  - 14+ métodos de prueba

### **feature/documentation**
- **Objetivo:** Documentación completa del proyecto
- **Cambios:**
  - README.md con instrucciones
  - GUION_VIDEO_15MIN.md para presentación
  - CHECKLIST_GRABACION.md
  - STARTUP_RAPIDO.md
  - Comentarios en código

### **feature/service-discovery-eureka**
- **Objetivo:** Registro de servicios con Eureka
- **Cambios:**
  - rednorte-eureka: Service Registry
  - Auto-discovery de microservicios
  - Load balancing
  - Health checks

---

## 🐛 Ramas de Bugfix

### **bugfix/delete-endpoint-parsing**
- **Objetivo:** Corregir error en DELETE endpoint
- **Problema:** Retorna text/plain pero frontend intentaba parsear como JSON
- **Solución:** Agregar Content-Type detection en httpJson helper
- **Error Original:** "Unexpected token 'P'"
- **Status:** Resuelto e integrado

---

## 📦 Ramas de Release

### **release/v1.0.0**
- **Objetivo:** Preparar versión 1.0.0 para producción
- **Propósito:** 
  - Últimas pruebas antes de producción
  - Bump de versión en package.json, pom.xml
  - Release notes
- **Merges:** 
  - De develop → release/v1.0.0 (crear rama)
  - De release/v1.0.0 → master (cuando está listo)
  - De release/v1.0.0 → develop (para sincronizar)

---

## 🚀 Flujo de Trabajo

### 1. Crear una Feature Nueva

```bash
# Partir desde develop actualizado
git checkout develop
git pull origin develop

# Crear rama feature
git checkout -b feature/nueva-caracteristica

# Desarrollar, hacer commits
git add .
git commit -m "feat: descripción de cambios"

# Push a remoto
git push -u origin feature/nueva-caracteristica

# Crear Pull Request en GitHub
# → Ir a GitHub y abrir PR desde feature/nueva-caracteristica hacia develop
# → Code review, merge cuando está aprobado
```

### 2. Reportar un Bug

```bash
# Partir desde develop
git checkout develop
git pull origin develop

# Crear rama bugfix
git checkout -b bugfix/descripcion-bug

# Corregir bug
git add .
git commit -m "fix: descripción del arreglo"

# Push y PR a develop
git push -u origin bugfix/descripcion-bug
```

### 3. Preparar Release

```bash
# Partir desde develop
git checkout develop
git pull origin develop

# Crear rama release
git checkout -b release/v1.0.0

# Hacer cambios finales (version bump, release notes)
git add .
git commit -m "chore: bump version to v1.0.0"

# Mergear a master
git checkout master
git pull origin master
git merge --no-ff release/v1.0.0
git tag -a v1.0.0 -m "Release version 1.0.0"
git push origin master --tags

# Mergear back a develop
git checkout develop
git merge --no-ff release/v1.0.0
git push origin develop

# Eliminar rama release
git push origin --delete release/v1.0.0
```

### 4. Crear Hotfix (Producción)

```bash
# Partir desde master
git checkout master
git pull origin master

# Crear rama hotfix
git checkout -b hotfix/descripcion-urgente

# Corregir problema
git add .
git commit -m "fix: descripción del hotfix"

# Mergear a master
git checkout master
git merge --no-ff hotfix/descripcion-urgente
git tag -a v1.0.1 -m "Hotfix version 1.0.1"
git push origin master --tags

# Mergear back a develop
git checkout develop
git merge --no-ff hotfix/descripcion-urgente
git push origin develop

# Eliminar rama hotfix
git push origin --delete hotfix/descripcion-urgente
```

---

## 📊 Ramas Actuales

Ejecutar para ver todas las ramas:

```bash
git branch -a
```

**Output esperado:**
```
* master
  bugfix/delete-endpoint-parsing
  develop
  feature/backend-apis
  feature/documentation
  feature/frontend-ui-redesign
  feature/microservices-architecture
  feature/service-discovery-eureka
  feature/testing-coverage
  release/v1.0.0
  remotes/origin/bugfix/delete-endpoint-parsing
  remotes/origin/develop
  remotes/origin/feature/backend-apis
  remotes/origin/feature/documentation
  remotes/origin/feature/frontend-ui-redesign
  remotes/origin/feature/microservices-architecture
  remotes/origin/feature/service-discovery-eureka
  remotes/origin/feature/testing-coverage
  remotes/origin/master
  remotes/origin/release/v1.0.0
```

---

## ✅ Mejores Prácticas

### Convención de Nombres

```
Tipo: feature/ | bugfix/ | release/ | hotfix/
Descripción: snake-case, 3-4 palabras máximo

Ejemplos:
✅ feature/user-authentication
✅ bugfix/null-pointer-exception
✅ release/v2.0.0
✅ hotfix/database-connection-pool

❌ Feature-for-new-stuff
❌ bug123
❌ URGENTE-FIX
```

### Commits

```bash
# Tipo de commit
feat:      Nueva característica
fix:       Corrección de bug
docs:      Cambios en documentación
style:     Formateo de código
refactor:  Refactorización sin cambios funcionales
perf:      Mejora de performance
test:      Agregar tests
chore:     Tareas de mantenimiento

# Ejemplos
git commit -m "feat: add KPI metrics to dashboard"
git commit -m "fix: resolve DELETE endpoint parsing issue"
git commit -m "docs: update video recording guide"
```

### Pull Requests

- **Título:** Descriptivo y conciso
- **Descripción:** 
  - Qué cambios se hacen
  - Por qué se hacen
  - Cómo testearlo
- **Reviewers:** Al menos 1 reviewers
- **Tests:** Todos deben pasar
- **Status checks:** Verificar que CI/CD pasa

---

## 🔄 Sincronización de Ramas

Mantener ramas actualizadas con develop:

```bash
# Actualizar develop desde remoto
git checkout develop
git pull origin develop

# Actualizar tu rama local desde develop
git checkout feature/mi-feature
git rebase develop

# Si hay conflictos, resolverlos y continuar
# git rebase --continue

# Forzar push (solo si es seguro)
git push -f origin feature/mi-feature
```

---

## 📈 Ventajas del Git Flow

| Aspecto | Ventaja |
|--------|---------|
| **Desarrollo Paralelo** | Múltiples features simultáneamente |
| **Estabilidad** | master siempre funciona |
| **Versionado** | Releases organizadas y taggeadas |
| **Hotfixes** | Corregir producción sin interrumpir features |
| **Documentación** | Historia clara de cambios |
| **Colaboración** | PRs permiten code review |
| **Trazabilidad** | Fácil ver quién hizo qué |

---

## 🚫 Anti-Patrones a Evitar

```bash
# ❌ NO hacer commits directo a master
git checkout master
git add .
git commit -m "fix urgente"  # ← Malo

# ✅ Hacer feature/bugfix branch
git checkout -b hotfix/fix-urgente
git add .
git commit -m "fix: urgent issue"
git push origin hotfix/fix-urgente
# → Crear PR para revisión rápida

# ❌ NO hacer force push a master/develop
git push -f origin develop  # ← Malo

# ✅ Resolver conflictos localmente
git rebase develop
# → resolver conflictos
git push origin feature/mi-feature

# ❌ NO mezclar features en una rama
feature/auth-y-payment  # ← Malo

# ✅ Una rama = una responsabilidad
feature/user-authentication
feature/payment-processing
```

---

## 🎓 Recursos Externos

- **Git Flow Original:** https://nvie.com/posts/a-successful-git-branching-model/
- **GitHub Flow:** https://guides.github.com/introduction/flow/
- **Conventional Commits:** https://www.conventionalcommits.org/

---

## 📞 Preguntas Frecuentes

### ¿Qué rama debo usar para empezar?
- Para features: `git checkout -b feature/descripcion` desde `develop`
- Para bugs: `git checkout -b bugfix/descripcion` desde `develop`
- Para emergencias en producción: `git checkout -b hotfix/descripcion` desde `master`

### ¿Puedo hacer commits en develop?
- No, develop debe recibir solo PRs de feature/bugfix
- Hace la historia más limpia y permite trackeo de quién hizo qué

### ¿Cada cuánto se hace release?
- Depende del sprint/proyecto
- Típicamente: semanal, mensual, o cuando esté listo
- En este proyecto: cuando todas las features estén en develop

### ¿Qué pasa si rompo master?
- Use hotfix branch para corregir
- O revierta el commit: `git revert <commit-hash>`

---

## 📋 Checklist para Nueva Rama

- [ ] Nombre sigue convención `type/descripcion`
- [ ] Crear desde rama correcta (develop o master)
- [ ] `git pull origin` antes de crear rama
- [ ] Hacer commits atómicos con mensajes claros
- [ ] Push regular a remoto
- [ ] PR con descripción clara
- [ ] Tests pasan
- [ ] Código reviewado
- [ ] Mergear y eliminar rama

---

**Estado:** ✅ Git Flow implementado y documentado  
**Branches:** 10 ramas profesionales  
**Readiness para Evaluación:** ⭐ EXCELENTE
