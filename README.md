# Operación Modular

Juego web de Matemática Discreta (60 minutos): relaciones binarias, equivalencias, divisibilidad y aritmética modular.

## Publicación en GitHub Pages
En GitHub abre **Settings → Pages**. En **Build and deployment**, elige **Deploy from a branch**, rama `main`, carpeta `/(root)` y guarda. La dirección será https://annaquid.github.io/operacion-modular/ cuando finalice el despliegue.

## Configuración de Supabase
1. Crea un proyecto Supabase.
2. Ejecuta `supabase/schema.sql` en SQL Editor.
3. En Authentication, crea una cuenta para la profesora y desactiva el registro público.
4. Sustituye los valores `CONFIGURA_SUPABASE_URL` y `CONFIGURA_SUPABASE_ANON_KEY` al principio de `index.html` por Project URL y anon/publishable key.
5. Publica el cambio. Los estudiantes envían resultados sin iniciar sesión; solo usuarios autenticados pueden leerlos.

No introduzcas nunca la service_role key en el HTML. La puntuación es una actividad didáctica, no una evaluación oficial antifraude.
