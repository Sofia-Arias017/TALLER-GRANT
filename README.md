# TALLER GRANT
## Sistema de Ecommerce Zapatos


### Objetivo

En este taller desarrollé la gestión de usuarios y privilegios para el sistema Ecommerce Zapatos.
El propósito fue crear diferentes cuentas de usuario en MySQL, asignarles permisos específicos según sus responsabilidades dentro del sistema, y aplicar medidas de seguridad como límites de consultas, funciones y procedimientos almacenados.

### 1. Creación de Usuarios

Comencé creando los diferentes usuarios del sistema, definiendo sus nombres, contraseñas seguras y el tipo de acceso. Cada usuario representa un rol dentro del sistema de Ecommerce, y fue configurado para conectarse desde cualquier host.

Los usuarios creados fueron:

Administrador (admin)

Cajero (cajero)

Analista (analista)

Desarrollador (desarrollador)

### 2. Asignación de Privilegios

A cada usuario le otorgué los permisos necesarios según su función:

Administrador: tiene acceso total al sistema, puede realizar cualquier operación y también administrar los privilegios de otros usuarios.

Cajero: se encarga de registrar pedidos, generar facturas y gestionar las ventas desde el punto de venta. Solo puede acceder y modificar información relacionada con esas tareas.

Analista: se dedica a consultar los datos del sistema, generar reportes y analizar información de ventas, productos y clientes, sin modificar los datos.

Desarrollador: tiene permisos completos sobre la base de datos para realizar pruebas, modificar estructuras y evaluar funcionalidades durante el desarrollo del sistema.

### 3. Limitación de Consultas por Hora

Para reforzar la seguridad y optimizar el rendimiento, establecí un límite de consultas por hora para todos los usuarios, excepto el desarrollador, que necesita un acceso más libre para las pruebas.
De esta forma, se evita que un usuario realice demasiadas operaciones que puedan afectar el rendimiento del sistema.

### 4. Procedimiento Almacenado: Ver mis pedidos

Implementé un procedimiento almacenado que permite a los usuarios consultar únicamente sus propios pedidos.
Este procedimiento mejora la seguridad, ya que evita que un cliente o cajero vea información de otros usuarios, garantizando que cada persona solo pueda acceder a sus propios registros.

### 5. Función: Calcular total mensual

También implementé una función que calcula el total de ventas de un mes específico.
Esta función es útil para generar reportes y estadísticas del desempeño del negocio durante un periodo determinado, sin tener que realizar consultas manuales cada vez.

### 6. Aplicación de Cambios

Finalmente, actualicé los privilegios del servidor MySQL para asegurar que todos los permisos y configuraciones quedaran aplicados correctamente.
Con esto, el sistema quedó listo con sus usuarios, privilegios y restricciones correctamente definidos.