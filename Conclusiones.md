## Conclusiones:

Después de realizar pruebas en la Api PetStore, se observó lo siguiente
1. La documentación de la Api, es completa y precisa
2. No cuenta con validaciones de duplicidad; cuando se envía la misma información dos veces, la primera la escribe y la segunda la sobre escribe. Esta falta de validación pasa con todas las opciones del campo ID
3. Los campos ID, solo aceptan campos númerico
4. Cuando se busca por el estado, pese a que en la documentación solo se presenta tres estados (available, pending and sold), cuando se hace una consulta con otro estado este no valida.
