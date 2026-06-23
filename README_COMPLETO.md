# 🏥 RedNorte Platform - Gestión de Pacientes y Citas

Sistema completo de gestión sanitaria con microservicios Java/Spring Boot y frontend React moderno.

## ✨ Características Implementadas

✅ **CRUD Completo**
- Crear, leer, actualizar y eliminar pacientes
- Crear, leer, actualizar y eliminar citas médicas
- Todas las operaciones en tiempo real

✅ **Búsqueda y Filtrado**
- Buscar pacientes por nombre o RUT
- Buscar citas por especialidad o fecha
- Filtrado instantáneo mientras escribes

✅ **UI Profesional**
- Diseño responsivo (desktop y móvil)
- Modales elegantes para editar registros
- Notificaciones Toast (éxito, error)
- Validación de formularios robusta
- Tema sanitario coherente (colores teal/cyan)

✅ **Arquitectura Escalable**
- Patrón BFF (Backend For Frontend)
- Microservicios independientes
- Eureka Service Discovery
- Bases de datos H2 embebidas

---

## 🚀 Inicio Rápido

### Opción 1: Sistema Completo (Recomendado)

Ejecuta este comando desde la raíz del workspace:

```powershell
.\start-complete.ps1
```

Esto:
- ✅ Inicia Eureka (puerto 8761)
- ✅ Inicia ms-pacientes (puerto 8081)
- ✅ Inicia ms-citas (puerto 8082)
- ✅ Inicia BFF Gateway (puerto 8080)
- ✅ Inicia Frontend React (puerto 5173)
- ✅ Abre automáticamente http://localhost:5173

### Opción 2: Inicio Manual

**Terminal 1 - Servicios Backend:**
```powershell
.\start-local.ps1
```

**Terminal 2 - Frontend:**
```powershell
cd rednorte-frontend
npm run dev
```

Luego abre: http://localhost:5173

---

## 🔍 Operaciones Disponibles

### Pacientes

| Operación | Cómo | Resultado |
|-----------|------|-----------|
| **Crear** | Llena formulario "Crear Paciente" + Click ➕ | Nuevo paciente en lista |
| **Ver** | Scroll lista de pacientes | Nombre y RUT visible |
| **Editar** | Click ✏️ en paciente | Modal edición, Guardar cambios |
| **Eliminar** | Click 🗑️ en paciente | Confirmación → Eliminado |
| **Buscar** | Escribe en 🔍 Buscar paciente | Lista filtrada en tiempo real |

### Citas

| Operación | Cómo | Resultado |
|-----------|------|-----------|
| **Crear** | Fecha + Especialidad + Selecciona paciente + Click ➕ | Nueva cita en lista |
| **Ver** | Scroll lista de citas | Especialidad, fecha y paciente |
| **Editar** | Click ✏️ en cita | Modal edición, Guardar cambios |
| **Eliminar** | Click 🗑️ en cita | Confirmación → Eliminada |
| **Buscar** | Escribe en 🔍 Buscar cita | Lista filtrada en tiempo real |

---

## 📊 Arquitectura

```
RedNorte Platform
├── Frontend (React + Vite)
│   └── http://localhost:5173
│       ├── Pacientes Container
│       ├── Citas Container
│       └── Search & Modals
│
├── BFF Gateway (Spring Boot)
│   └── http://localhost:8080/api
│       ├── /pacientes (GET, POST, PUT, DELETE)
│       └── /citas (GET, POST, PUT, DELETE)
│
├── Eureka Discovery
│   └── http://localhost:8761
│
└── Microservicios
    ├── ms-pacientes (puerto 8081)
    └── ms-citas (puerto 8082)
```

---

## 🛠️ Stack Tecnológico

### Backend
- **Spring Boot 4.0.7** - Framework Java
- **Spring Data JPA** - Acceso a datos
- **H2 Database** - Base de datos embebida
- **Eureka** - Service Discovery
- **Maven** - Build tool

### Frontend
- **React 19.2.6** - UI library
- **Vite 8.0.14** - Build tool
- **CSS3** - Styling responsivo
- **Fetch API** - HTTP requests

---

## 📝 Validaciones

- ✅ Nombre y RUT requeridos para pacientes
- ✅ Fecha, especialidad y paciente requeridos para citas
- ✅ Campos no pueden ser vacíos
- ✅ RUT único por paciente (validado por backend)

---

## 🔧 Comandos Útiles

### Frontend
```powershell
# Desarrollo con hot reload
npm run dev

# Compilar para producción
npm run build

# Previewar build
npm run preview
```

### Backend (desde cada carpeta de servicio)
```powershell
# Compilar
mvn clean package -DskipTests

# Tests (si existen)
mvn test
```

---

## 📱 Datos de Prueba

Puedes crear datos de prueba directamente en la UI:

**Ejemplo Paciente:**
- Nombre: Juan Pérez García
- RUT: 12345678-K

**Ejemplo Cita:**
- Fecha: 2025-12-25
- Especialidad: Cardiología
- Paciente: (selecciona del dropdown)

---

## ⚠️ Solución de Problemas

### ❌ "Connection refused" al abrir http://localhost:5173

**Solución:** Espera 30 segundos más para que el frontend compile.

### ❌ "Service unavailable" en operaciones CRUD

**Solución:** Verifica que todos los servicios estén iniciados:
- http://localhost:8761 (Eureka)
- http://localhost:8080 (BFF)
- http://localhost:8081 (Pacientes)
- http://localhost:8082 (Citas)

### ❌ Puerto ya en uso

**Solución:** Cierra el servicio anterior:
```powershell
# Windows - Encuentra y mata el proceso
Get-NetTCPConnection -LocalPort 5173 | ForEach-Object {Stop-Process -Id $_.OwningProcess -Force}
```

---

## 📈 Próximos Pasos

1. Exportar datos a CSV/Excel
2. Reportes médicos
3. Autenticación de usuarios
4. Historial de cambios
5. Integración con calendario
6. Notificaciones de citas

---

## 📞 Soporte

Para problemas o sugerencias, revisa:
- Logs de cada servicio en sus ventanas PowerShell
- Browser DevTools (F12) para errores frontend
- `/api/pacientes` y `/api/citas` en Postman

---

**¡Disfruta gestionando pacientes y citas con RedNorte! 🏥**
