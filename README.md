## Консольная утилита для создания и применения бэкапов
# Установка
склонируйте репозиторий локально `git@github.com:Luckupants/backup.git`

соберите проект с помощью cmake, например заупстив из корня проекта

```
mkdir build
cd build
cmake ..
make
```

также на всякий случай есть скомпилированные бинарники backup и restore в корне директории

# Использование
Утилита состоит из 2 частей - backup и restore.
У каждой есть флаг `--help` выводящий мини документацию.
в случае ошибки программы напишут в каком именно месте произошла ошибка.

backup делает бекап директории. Он принимает аргументом флаг означающий тип бэкапа `--type=full` или `--type=incremental` а также два пути: backup_from и backup_to, откуда и куда бэкапить соответственно. Бэкапы сохраняются в папках соответствующих времени бэкапа. Инкрементальное обновление сохраняет информацию о файлах, которые были изменены по сравнению с предыдущим полным бэкапом, так что для вызова инкрементального бэкапа нужно хотя бы раз вызвать полный бэкап

restore принимает два пути restore_from и restore_to, откуда и куда восстанавливать бэкап. restore_to может быть как уже имеющейся директорией, тогда ее содержимое будет заменено на примененный бэкап, так и несуществующим путем, тогда нужная директория создастся.

разделители в конце пути игнорируются.

# Пример использования

```
./backup --type=full ./workdir ./backupdir
./restore ./backupdir/2024-10-03_12-10-10/ ./appliedbackup
```

# Решение

Для того чтобы сделать полный бэкап нужно просто скопировать директорию, правильно обработав ошибки, чтобы пользователю было понятно что пошло не так.

Для инкрементального бэкапа достаточно пройтись по файлам из последнего полного бэкапа и текущей директории и если файл появился или изменился, то скопировать его, а если он удалился то создать файл с именем `DELETED{filename}`, такой подход, конечно, неидеален и в идеале можно было бы, например, создать отдельную директурию с технической информацией,  том числе об удаленных файлах, но времени не хватило и в целом решение не слишком плохое. Чтобы сохранить факт удаления директории достоточно создать файл `DELETE` в сбэкапленной версии, минусы те же что и у удаленных файлов. 

тип обновления определяется содержанием файла `backup_tag` в корне бэкапа, что тоже неидеально и стоило бы хранить в отдельном месте

также файл считается неизмененным, если последнее время изменения бэкапной версии позже чем время изменения рабочей версии. Тоже по хорошему стоило бы сохранять информацию о времени изменения, но не критично.

Итого решение можно улучшать, но и то что имеется не плохо.
