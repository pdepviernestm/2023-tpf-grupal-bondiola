data Archivo = UnArchivo
  { nombreArchivo :: String,
    contenido :: String
  }
  deriving (Show, Eq)

data Carpeta = UnaCarpeta
  { nombreCarpeta :: String,
    archivos :: [Archivo]
  }
  deriving (Show, Eq)

leeme :: Archivo
leeme = UnArchivo "leeme.md" "hola que hace"

vacio :: Archivo
vacio = UnArchivo "vacio.md" ""

pdep :: Carpeta
pdep = UnaCarpeta "pdep" [leeme, vacio]

-- Orden superior
-- commit comando nombreArchivo =
obtenerNombreArchivo :: Archivo -> String
obtenerNombreArchivo archivo = nombreArchivo archivo

comprobarSiExisteArchivo :: String -> Carpeta -> Bool
comprobarSiExisteArchivo nombreArchivo carpeta = elem nombreArchivo (map obtenerNombreArchivo (archivos carpeta))

-- CREAR
crear :: String -> Carpeta -> Carpeta
crear nombreArchivo carpeta
  | comprobarSiExisteArchivo nombreArchivo carpeta = carpeta
  | otherwise = UnaCarpeta (nombreCarpeta carpeta) (archivos carpeta ++ [UnArchivo nombreArchivo ""])

-- VACIAR
vaciar :: Carpeta -> Carpeta
vaciar carpeta = UnaCarpeta (nombreCarpeta carpeta) []

-- ELIMINAR
evaluarArchivo :: String -> Archivo -> Bool
evaluarArchivo nombreArchivo1 archivo1
  | nombreArchivo archivo1 == nombreArchivo1 = False
  | otherwise = True

eliminar :: String -> Carpeta -> Carpeta
eliminar nombreArchivo carpeta
  | not (comprobarSiExisteArchivo nombreArchivo carpeta) = carpeta
  | otherwise = UnaCarpeta (nombreCarpeta carpeta) (filter (evaluarArchivo nombreArchivo) (archivos carpeta))

-- AGREGAR
evaluarAplicarContenido :: String -> String -> Archivo -> Archivo
evaluarAplicarContenido nombreArchivo1 contenidoNuevo archivo1
  | nombreArchivo archivo1 == nombreArchivo1 = UnArchivo (nombreArchivo archivo1) (contenidoNuevo ++ " " ++ contenido archivo1)
  | otherwise = archivo1

agregar :: String -> String -> Carpeta -> Carpeta
agregar contenidoNuevo nombreArchivo carpeta
  | not (comprobarSiExisteArchivo nombreArchivo carpeta) = carpeta
  | otherwise = UnaCarpeta (nombreCarpeta carpeta) (map (evaluarAplicarContenido nombreArchivo contenidoNuevo) (archivos carpeta))

-- SACAR
recortarString :: String -> Int -> Int -> String
recortarString cadena inicio fin = take inicio cadena ++ drop fin cadena

evaluarSacarContenido :: String -> Int -> Int -> Archivo -> Archivo
evaluarSacarContenido nombreArchivo1 inicio fin archivo1
  | nombreArchivo archivo1 == nombreArchivo1 = UnArchivo (nombreArchivo archivo1) (recortarString (contenido archivo1) inicio fin)
  | otherwise = archivo1

sacar :: String -> Carpeta -> Int -> Int -> Carpeta
sacar nombreArchivo carpeta inicio fin
  | not (comprobarSiExisteArchivo nombreArchivo carpeta) = carpeta
  | otherwise = UnaCarpeta (nombreCarpeta carpeta) (map (evaluarSacarContenido nombreArchivo inicio fin) (archivos carpeta))
