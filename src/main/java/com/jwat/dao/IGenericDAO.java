package com.jwat.dao;

import java.util.List;

import com.jwat.mapper.IRowMapper;

public interface IGenericDAO<T> {
    @SuppressWarnings("hiding")
	<T> List<T> query(String sql, IRowMapper<T> rowMapper, Object... parameters);

    boolean update(String sql, Object... parameters);

    Long insert(String sql, Object... parameters);

    int count(String sql, Object... parameters);
}
