@echo off
for /f "delims=" %%i in ('dir /s/b *.md') do (
        for /f "delims=" %%a in ('type "%%~fi"') do (
                set "foo=%%a"
                call,set foo=%%foo:\\=\\\\%%
                call,set foo=%%foo:_=\_%%
                call,set foo=%%foo:\{=\\{%%
                call,set foo=%%foo:\}=\\}%%
                call,set foo=%%foo:\#=\\#%%
                call,echo/%%foo%%>>"%%~fi._"
)
move "%%~fi._" "%%~fi"
)
exit