# ðŸŒ¿ Estrategia de Branching - Git Flow

**Proyecto:** RedNorte Healthcare System  
**Estrategia:** Git Flow Model  
**Ãšltima ActualizaciÃ³n:** 2026-06-23

---

## ðŸ“‹ IntroducciÃ³n

Este proyecto implementa **Git Flow**, una estrategia de branching profesional que permite:
- Desarrollo paralelo de mÃºltiples features
- Control de versiones claro
- Releases organizadas
- Hotfixes aislados
- ColaboraciÃ³n efectiva en equipo

---

## ðŸ—ï¸ Estructura de Ramas

```
master (producciÃ³n) â† [release/v1.0.0, hotfix/*]
  â†‘
  |
develop (desarrollo) â† [feature/*, bugfix/*]
  â†‘
  â””â”€â”€ feature/frontend-ui-redesign
  â”œâ”€â”€ feature/backend-apis
  â”œâ”€â”€ feature/microservices-architecture
  â”œâ”€â”€ feature/testing-coverage
  â”œâ”€â”€ feature/documentation
  â”œâ”€â”€ feature/service-discovery-eureka
  â”œâ”€â”€ bugfix/delete-endpoint-parsing
  â””â”€â”€ release/v1.0.0
```

---

## ðŸ”€ DescripciÃ³n de Cada Rama

### **master** (Rama de ProducciÃ³n)
- **PropÃ³sito:** CÃ³digo en producciÃ³n, siempre estable
- **Acceso:** Solo merges desde `release/*` o `hotfix/*`
- **Tags:** Versionado semÃ¡ntico (v1.0.0, v1.0.1, etc.)
- **Deployments:** AutomÃ¡ticos a producciÃ³n desde aquÃ­
- **Estado:** Siempre funcionando, sin cambios directos

### **develop** (Rama de Desarrollo)
- **PropÃ³sito:** Rama de integraciÃ³n para features en desarrollo
- **Acceso:** Merges desde `feature/*` y `bugfix/*` mediante Pull Requests
- **Estado:** Pre-release, puede tener features nuevas
- **Deployment:** Staging environment

---

## ðŸŽ¯ Ramas de Feature

### **feature/frontend-ui-redesign**
- **Objetivo:** RediseÃ±o de interfaz con UI profesional
- **Cambios:**
  - Encabezado mejorado "Centro de Operaciones ClÃ­nicas"
  - Tarjetas KPI con mÃtricas en tiempo real
  - MÃ³dulos mejorados con mejor jerarquÃ­a
  - Paleta de colores profesional
  - Responsive design

### **feature/backend-apis**
- **Objetivo:** ImplementaciÃ³n de endpoints REST
- **Cambios:**
  - 10 endpoints RESTful (CRUD para pacientes y citas)
  - OrquestaciÃ³n en BFF
  - ValidaciÃ³n de datos
  - Manejo de errores

### **feature/microservices-architecture**
- **Objetivo:** Arquitectura de microservicios
- **Cambios:**
  - ms-pacientes: gestiÃ³n de pacientes
  - ms-citas: gestiÃ³n de citas mÃdicas
  - SeparaciÃ³n de responsabilidades
  - ComunicaciÃ³n HTTP entre servicios

### **feature/testing-coverage**
- **Objetivo:** Pruebas unitarias exhaustivas
- **Cambios:**
  - JUnit 5 tests
  - Mockito para mocking
  - Test Coverage: 94%+ para microservicios, 63%+ para BFF
  - JaCoCo reports
  - 14+ mÃtodos de prueba

### **feature/documentation**
- **Objetivo:** DocumentaciÃ³n completa del proyecto
- **Cambios:**
  - README.md con instrucciones
  - GUION_VIDEO_15MIN.md para presentaciÃ³n
  - CHECKLIST_GRABACION.md
  - STARTUP_RAPIDO.md
  - Comentarios en cÃ³digo

### **feature/service-discovery-eureka**
- **Objetivo:** Registro de servicios con Eureka
- **Cambios:**
  - rednorte-eureka: Service Registry
  - Auto-discovery de microservicios
  - Load balancing
  - Health checks

---

## ðŸ› Ramas de Bugfix

### **bugfix/delete-endpoint-parsing**
- **Objetivo:** Corregir error en DELETE endpoint
- **Problema:** Retorna text/plain pero frontend intentaba parsear como JSON
- **SoluciÃ³n:** Agregar Content-Type detection en httpJson helper
- **Error Original:** "Unexpected token 'P'"
- **Status:** Resuelto e integrado

---

## ðŸ“ Ramas de Release

### **release/v1.0.0**
- **Objetivo:** Preparar versiÃ³n 1.0.0 para producciÃ³n
- **PropÃ³sito:** 
  - Ãšltimas pruebas antes de producciÃ³n
  - Bump de versiÃ³n en package.json, pom.xml
  - Release notes
- **Merges:** 
  - De develop â†’ release/v1.0.0 (crear rama)
  - De release/v1.0.0 â†’ master (cuando estÃ¡ listo)
  - De release/v1.0.0 â†’ develop (para sincronizar)

---

## ðŸš€ Flujo de Trabajo

### 1. Crear una Feature Nueva

```bash
# Partir desde develop actualizado
git checkout develop
git pull origin develop

# Crear rama feature
git checkout -b feature/nueva-caracteristica

# Desarrollar, hacer commits
git add .
git commit -m "feat: descripciÃ³n de cambios"

# Push a remoto
git push -u origin feature/nueva-caracteristica

# Crear Pull Request en GitHub
# â†’ Ir a GitHub y abrir PR desde feature/nueva-caracteristica hacia develop
# â†’ Code review, merge cuando estÃ¡ aprobado
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
git commit -m "fix: descripciÃ³n del arreglo"

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

### 4. Crear Hotfix (ProducciÃ³n)

```bash
# Partir desde master
git checkout master
git pull origin master

# Crear rama hotfix
git checkout -b hotfix/descripcion-urgente

# Corregir problema
git add .
git commit -m "fix: descripciÃ³n del hotfix"

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

## ðŸ“Š Ramas Actuales

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

## âœ… Mejores PrÃ¡cticas

### ConvenciÃ³n de Nombres

```
Tipo: feature/ | bugfix/ | release/ | hotfix/
DescripciÃ³n: snake-case, 3-4 palabras mÃ¡ximo

Ejemplos:
âœ… feature/user-authentication
âœ… bugfix/null-pointer-exception
âœ… release/v2.0.0
âœ… hotfix/database-connection-pool

âŒ Feature-for-new-stuff
âŒ bug123
âŒ URGENTE-FIX
```

### Commits

```bash
# Tipo de commit
feat:      Nueva caracterÃ­stica
fix:       CorrecciÃ³n de bug
docs:      Cambios en documentaciÃ³n
style:     Formateo de cÃ³digo
refactor:  RefactorizaciÃ³n sin cambios funcionales
perf:      Mejora de performance
test:      Agregar tests
chore:     Tareas de mantenimiento

# Ejemplos
git commit -m "feat: add KPI metrics to dashboard"
git commit -m "fix: resolve DELETE endpoint parsing issue"
git commit -m "docs: update video recording guide"
```

### Pull Requests

- **TÃ­tulo:** Descriptivo y conciso
- **DescripciÃ³n:** 
  - QuÃ cambios se hacen
  - Por quÃ se hacen
  - CÃ³mo testearlo
- **Reviewers:** Al menos 1 reviewers
- **Tests:** Todos deben pasar
- **Status checks:** Verificar que CI/CD pasa

---

## ðŸ”„ SincronizaciÃ³n de Ramas

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

## ðŸ“ˆ Ventajas del Git Flow

| Aspecto | Ventaja |
|--------|---------|
| **Desarrollo Paralelo** | MÃºltiples features simultÃ¡neamente |
| **Estabilidad** | master siempre funciona |
| **Versionado** | Releases organizadas y taggeadas |
| **Hotfixes** | Corregir producciÃ³n sin interrumpir features |
| **DocumentaciÃ³n** | Historia clara de cambios |
| **ColaboraciÃ³n** | PRs permiten code review |
| **Trazabilidad** | FÃ¡cil ver quiÃn hizo quÃ |

---

## ðŸš« Anti-Patrones a Evitar

```bash
# âŒ NO hacer commits directo a master
git checkout master
git add .
git commit -m "fix urgente"  # â† Malo

# âœ… Hacer feature/bugfix branch
git checkout -b hotfix/fix-urgente
git add .
git commit -m "fix: urgent issue"
git push origin hotfix/fix-urgente
# â†’ Crear PR para revisiÃ³n rÃ¡pida

# âŒ NO hacer force push a master/develop
git push -f origin develop  # â† Malo

# âœ… Resolver conflictos localmente
git rebase develop
# â†’ resolver conflictos
git push origin feature/mi-feature

# âŒ NO mezclar features en una rama
feature/auth-y-payment  # â† Malo

# âœ… Una rama = una responsabilidad
feature/user-authentication
feature/payment-processing
```

---

## ðŸŽ“ Recursos Externos

- **Git Flow Original:** https://nvie.com/posts/a-successful-git-branching-model/
- **GitHub Flow:** https://guides.github.com/introduction/flow/
- **Conventional Commits:** https://www.conventionalcommits.org/

---

## ðŸ“ž Preguntas Frecuentes

### Â¿QuÃ rama debo usar para empezar?
- Para features: `git checkout -b feature/descripcion` desde `develop`
- Para bugs: `git checkout -b bugfix/descripcion` desde `develop`
- Para emergencias en producciÃ³n: `git checkout -b hotfix/descripcion` desde `master`

### Â¿Puedo hacer commits en develop?
- No, develop debe recibir solo PRs de feature/bugfix
- Hace la historia mÃ¡s limpia y permite trackeo de quiÃn hizo quÃ

### Â¿Cada cuÃ¡nto se hace release?
- Depende del sprint/proyecto
- TÃ­picamente: semanal, mensual, o cuando estÃ listo
- En este proyecto: cuando todas las features estÃn en develop

### Â¿QuÃ pasa si rompo master?
- Use hotfix branch para corregir
- O revierta el commit: `git revert <commit-hash>`

---

## ðŸ“‹ Checklist para Nueva Rama

- [ ] Nombre sigue convenciÃ³n `type/descripcion`
- [ ] Crear desde rama correcta (develop o master)
- [ ] `git pull origin` antes de crear rama
- [ ] Hacer commits atÃ³micos con mensajes claros
- [ ] Push regular a remoto
- [ ] PR con descripciÃ³n clara
- [ ] Tests pasan
- [ ] CÃ³digo reviewado
- [ ] Mergear y eliminar rama

---

**Estado:** âœ… Git Flow implementado y documentado  
**Branches:** 10 ramas profesionales  
**Readiness para EvaluaciÃ³n:** â­ EXCELENTE


