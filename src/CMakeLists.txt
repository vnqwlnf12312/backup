project(SOURCE)

add_subdirectory(backup)

add_subdirectory(restore)

add_subdirectory(parsing)
target_link_libraries(backup PRIVATE parsing)
target_link_libraries(restore PRIVATE parsing)

add_subdirectory(utils)
target_link_libraries(backup PRIVATE utils)
target_link_libraries(restore PRIVATE utils)