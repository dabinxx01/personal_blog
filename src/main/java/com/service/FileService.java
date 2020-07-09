package com.service;

import org.springframework.stereotype.Repository;

@Repository
public interface FileService {
    byte[] getImageByte(String path) throws Exception;
}
