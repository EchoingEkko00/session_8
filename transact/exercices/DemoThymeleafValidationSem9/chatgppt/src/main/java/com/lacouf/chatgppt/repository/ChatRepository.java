package com.lacouf.chatgppt.repository;

import com.lacouf.chatgppt.model.Chat;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ChatRepository extends JpaRepository<Chat, Long> {
}