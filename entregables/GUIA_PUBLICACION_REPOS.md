# Guia de Publicacion de Repositorios RedNorte

Objetivo: evitar repositorios vacios y asegurar que cada integrante pueda revisar y ejecutar su componente.

## 1. Estructura minima obligatoria por repositorio

Cada repo debe contener como minimo:

1. README.md completo.
2. Codigo fuente.
3. Archivo de build (pom.xml o package.json).
4. Instrucciones de pruebas.
5. Seccion de evidencias o enlace a evidencia.

## 2. Checklist antes de subir a GitHub

1. Verificar que no este vacio: debe tener commits y archivos.
2. Verificar README con:
   - objetivo,
   - requisitos,
   - ejecucion,
   - pruebas,
   - endpoints o flujos.
3. Verificar que compile o ejecute localmente.
4. Verificar que exista al menos un flujo critico probado.
5. Publicar rama y abrir PR.

## 3. Comandos base de publicacion

```powershell
git add .
git commit -m "docs: completar informacion operativa del repositorio"
git push origin <rama>
```

Si el repositorio remoto aun no existe:

```powershell
git remote add origin <url-del-repo>
git branch -M main
git push -u origin main
```

## 4. Convencion de ramas

- main: estable
- develop: integracion
- feature/<tema>: trabajo individual
- fix/<tema>: correcciones

## 5. Validacion final para el equipo

1. Cada integrante clona el repo correspondiente.
2. Sigue README y levanta el componente.
3. Reporta observaciones en PR.
4. Se integra en develop y luego a main.
