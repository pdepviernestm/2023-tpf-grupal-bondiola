data Carpeta = UnaCarpeta
  { nombreCarpeta :: String,
    archivos :: [Archivo],
    branchActual :: Int,
    branches :: [Branch]
  }

data Archivo = UnArchivo
  { nombreArchivo :: String,
    contenido :: String
  }
  deriving (Show, Eq)

data Branch = UnaBranch
  { nombreBranch :: String,
    commits :: [Commit]
  }

data Commit = UnCommit
  { identificador :: Int,
    descripcion :: String,
    listaOperaciones :: [Carpeta -> Carpeta]
  }

-- CREAR
comprobarSiExisteArchivo :: String -> Carpeta -> Bool
comprobarSiExisteArchivo nombreArchivo1 carpeta = elem nombreArchivo1 (map nombreArchivo (archivos carpeta))

crear :: String -> Carpeta -> Carpeta
crear nombreArchivo carpeta
  | comprobarSiExisteArchivo nombreArchivo carpeta = carpeta
  | otherwise = UnaCarpeta (nombreCarpeta carpeta) (archivos carpeta ++ [UnArchivo nombreArchivo ""]) (branchActual carpeta) []

-- VACIAR
vaciar :: Carpeta -> Carpeta
vaciar carpeta = UnaCarpeta (nombreCarpeta carpeta) [] (branchActual carpeta) []

-- ELIMINAR
evaluarArchivo :: String -> Archivo -> Bool
evaluarArchivo nombreArchivo1 archivo1
  | nombreArchivo archivo1 == nombreArchivo1 = False
  | otherwise = True

eliminar :: String -> Carpeta -> Carpeta
eliminar nombreArchivo carpeta
  | not (comprobarSiExisteArchivo nombreArchivo carpeta) = carpeta
  | otherwise = UnaCarpeta (nombreCarpeta carpeta) (filter (evaluarArchivo nombreArchivo) (archivos carpeta)) (branchActual carpeta) (branches carpeta)

-- AGREGAR
evaluarAplicarContenido :: String -> String -> Archivo -> Archivo
evaluarAplicarContenido nombreArchivo1 contenidoNuevo archivo1
  | nombreArchivo archivo1 == nombreArchivo1 = UnArchivo (nombreArchivo archivo1) (contenidoNuevo ++ " " ++ contenido archivo1)
  | otherwise = archivo1

agregar :: String -> String -> Carpeta -> Carpeta
agregar contenidoNuevo nombreArchivo carpeta
  | not (comprobarSiExisteArchivo nombreArchivo carpeta) = carpeta
  | otherwise = UnaCarpeta (nombreCarpeta carpeta) (map (evaluarAplicarContenido nombreArchivo contenidoNuevo) (archivos carpeta)) (branchActual carpeta) (branches carpeta)

-- SACAR
recortarString :: String -> Int -> Int -> String
recortarString cadena inicio fin = take inicio cadena ++ drop fin cadena

evaluarSacarContenido :: String -> Int -> Int -> Archivo -> Archivo
evaluarSacarContenido nombreArchivo1 inicio fin archivo1
  | nombreArchivo archivo1 == nombreArchivo1 = UnArchivo (nombreArchivo archivo1) (recortarString (contenido archivo1) inicio fin)
  | otherwise = archivo1

sacar :: String -> Int -> Int -> Carpeta -> Carpeta
sacar nombreArchivo inicio fin carpeta
  | not (comprobarSiExisteArchivo nombreArchivo carpeta) = carpeta
  | otherwise = UnaCarpeta (nombreCarpeta carpeta) (map (evaluarSacarContenido nombreArchivo inicio fin) (archivos carpeta)) (branchActual carpeta) (branches carpeta)

-- COMMIT

commit :: Carpeta -> String -> Carpeta -> Carpeta
commit carpeta descripcion cambio = cambio

aplicarCommits :: Carpeta -> [Commit] -> Carpeta
aplicarCommits carpeta commits = foldl (flip ($)) carpeta (foldl1 (++) (map listaOperaciones commits))

-- esInutil :: Carpeta -> Carpeta -> Bool
-- esInutil carpeta carpeta2 = carpeta == carpeta2

-- dejaDeSerInutil :: Carpeta -> [Carpeta -> Carpeta] -> Bool
-- dejaDeSerInutil carpeta cambios = commit2 carpeta cambios "asd" /= commit2 carpeta (reverse cambios) "asd"

-- PARTE II
carpeta1 = UnaCarpeta "carpetaPrueba" [] 0 [UnaBranch "main" []]

existeBranch :: Carpeta -> String -> Bool
existeBranch carpeta nombreBranch1 = elem nombreBranch1 (map (nombreBranch) (branches carpeta))

evaluarBranch :: String -> Branch -> Bool
evaluarBranch nombreBranch1 branch1
  | nombreBranch branch1 == nombreBranch1 = True
  | otherwise = False

obtenerBranchPorNombre :: String -> Carpeta -> Branch
obtenerBranchPorNombre name folder = head (filter (evaluarBranch name) (branches folder))

checkout :: Carpeta -> String -> Carpeta
checkout carpeta1 nombreBranch
  | existeBranch carpeta1 nombreBranch = aplicarCommits carpeta1 (commits (obtenerBranchPorNombre nombreBranch carpeta1))
  | otherwise = UnaCarpeta (nombreCarpeta carpeta1) (archivos carpeta1) (branchActual carpeta1 + 1) (branches carpeta1 ++ [UnaBranch nombreBranch (commits (branches carpeta1 !! branchActual carpeta1))])

checkout2 :: Carpeta -> String -> Int -> Carpeta
checkout2 carpeta1 nombreBranch primerosNCommits = aplicarCommits carpeta1 (take primerosNCommits (commits (obtenerBranchPorNombre nombreBranch carpeta1)))