@echo off
setlocal
set "DB=%1"
if "%DB%"=="" set "DB=mesh"
echo.
echo Source db: %DB%
echo.
echo Query:  mesh-base-to-skos.rq
call tdb2_tdbquery --loc=databases/%DB% --query=mesh-base-to-skos.rq --time > %DB%-skos-base.ttl || goto :error
echo - output: %DB%-skos-base.ttl
echo.
echo Query:  mesh-qual-to-skos.rq
call tdb2_tdbquery --loc=databases/%DB% --query=mesh-qual-to-skos.rq --time > %DB%-skos-qual.ttl || goto :error
echo - output: %DB%-skos-qual.ttl
echo.
echo Query:  mesh-rest-to-skos.rq
call tdb2_tdbquery --loc=databases/%DB% --query=mesh-rest-to-skos.rq --time > %DB%-skos-rest.ttl || goto :error
echo - output: %DB%-skos-rest.ttl
echo.
echo Query:  mesh-scr-to-skos.rq
call tdb2_tdbquery --loc=databases/%DB% --query=mesh-scr-to-skos.rq --time > %DB%-skos-scr.ttl || goto :error
echo - output: %DB%-skos-src.ttl
echo.
echo Merging output files...
call riot --out=TTL mesh-skos-patch.ttl %DB%-skos-base.ttl %DB%-skos-qual.ttl %DB%-skos-rest.ttl %DB%-skos-scr.ttl > %DB%-skos.ttl || goto :error
echo - done: %DB%-skos.ttl

echo.
echo Finished: %DB%-skos.ttl
echo.
goto :eof

:error
echo.
echo ERROR: SKOS export failed
echo.
endlocal
exit /b 1

endlocal
