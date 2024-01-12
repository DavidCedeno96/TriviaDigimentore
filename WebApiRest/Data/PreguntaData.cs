using System.Data.SqlClient;
using System.Data;
using WebApiRest.Models;
using WebApiRest.Utilities;

namespace WebApiRest.Data {
    public class PreguntaData {

        private readonly Conexion conexion = new();

        public async Task<PreguntaList> GetPreguntaList(int estados) {
            PreguntaList list = new() {
                Lista = new()
            };            
            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());

            SqlCommand cmd = new("sp_B_Pregunta", sqlConnection) {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@estados", estados);

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try {
                await sqlConnection.OpenAsync();
                SqlDataReader dr = await cmd.ExecuteReaderAsync();
                while (await dr.ReadAsync()) {
                    list.Lista.Add(new Pregunta() {
                        IdPregunta = Convert.ToInt32(dr["idPregunta"].ToString()),                        
                        Nombre = dr["nombre"].ToString(),
                        IdSala = Convert.ToInt32(dr["idSala"].ToString()),                        
                        Estado = Convert.ToInt16(dr["estado"].ToString()),
                        FechaCreacion = Convert.ToDateTime(dr["fecha_creacion"].ToString()),
                        FechaModificacion = Convert.ToDateTime(dr["fecha_modificacion"].ToString())
                    });
                }

                list.Info = WC.GetSatisfactorio();
                list.Error = 0;
                
            } catch (Exception ex) {
                list.Info = ex.Message;
                list.Error = 1;
                list.Lista = null;
            } finally {
                await sqlConnection.CloseAsync();
            }

            return list;
        }

        public async Task<PreguntaList> GetPreguntaList(int estados, int idSala) {
            PreguntaList list = new() {
                Lista = new()
            };
            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());

            SqlCommand cmd = new("sp_B_PreguntaByIdSala", sqlConnection) {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@idSala", idSala);
            cmd.Parameters.AddWithValue("@estados", estados);

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try {
                await sqlConnection.OpenAsync();
                SqlDataReader dr = await cmd.ExecuteReaderAsync();
                while (await dr.ReadAsync()) {
                    list.Lista.Add(new Pregunta() {
                        IdPregunta = Convert.ToInt32(dr["idPregunta"].ToString()),
                        Nombre = dr["nombre"].ToString(),
                        IdSala = Convert.ToInt32(dr["idSala"].ToString()),
                        Estado = Convert.ToInt16(dr["estado"].ToString()),
                        FechaCreacion = Convert.ToDateTime(dr["fecha_creacion"].ToString()),
                        FechaModificacion = Convert.ToDateTime(dr["fecha_modificacion"].ToString())
                    });
                }
                await dr.NextResultAsync();
                                
                list.Info = cmd.Parameters["@info"].Value.ToString();
                list.Error = Convert.ToInt16(cmd.Parameters["@error"].Value.ToString());

            } catch (Exception ex) {
                list.Info = ex.Message;
                list.Error = 1;
                list.Lista = null;
            } finally {
                await sqlConnection.CloseAsync();
            }

            return list;
        }

        public async Task<PreguntaItem> GetPregunta(int estados, int idPregunta)
        {
            PreguntaItem item = new();

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());

            SqlCommand cmd = new("sp_B_PreguntaById", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@idPregunta", idPregunta);
            cmd.Parameters.AddWithValue("@estados", estados);

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try
            {
                await sqlConnection.OpenAsync();
                SqlDataReader dr = await cmd.ExecuteReaderAsync();
                if (await dr.ReadAsync())
                {
                    item.Pregunta = new Pregunta()
                    {
                        IdPregunta = Convert.ToInt32(dr["idPregunta"].ToString()),                        
                        Nombre = dr["nombre"].ToString(),
                        IdSala = Convert.ToInt32(dr["idSala"].ToString()),                                                
                        Estado = Convert.ToInt16(dr["estado"].ToString()),
                        FechaCreacion = Convert.ToDateTime(dr["fecha_creacion"].ToString()),
                        FechaModificacion = Convert.ToDateTime(dr["fecha_modificacion"].ToString())
                    };
                }
                await dr.NextResultAsync();

                item.Info = cmd.Parameters["@info"].Value.ToString();
                item.Error = Convert.ToInt16(cmd.Parameters["@error"].Value.ToString());
            }
            catch (Exception ex)
            {
                item.Info = ex.Message;
                item.Error = 1;
                item.Pregunta = null;
            }
            finally
            {
               await sqlConnection.CloseAsync();
            }

            return item;
        }

        public async Task<Response> CreatePregunta(Pregunta pregunta) {
            Response response = new();

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());
            SqlCommand cmd = new("sp_C_Pregunta", sqlConnection) {
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.AddWithValue("@nombre", WC.GetTrim(pregunta.Nombre));
            cmd.Parameters.AddWithValue("@idSala", pregunta.IdSala);

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try {
                await sqlConnection.OpenAsync();
                await cmd.ExecuteNonQueryAsync();

                response.Info = cmd.Parameters["@info"].Value.ToString();
                response.Error = Convert.ToInt16(cmd.Parameters["@error"].Value.ToString());

            } catch (Exception ex) {
                response.Info = ex.Message;
                response.Error = 1;
            } finally {
                await sqlConnection.CloseAsync();
            }

            return response;
        }

        public async Task<Response> UpdatePregunta(Pregunta pregunta) {
            Response response = new();

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());
            SqlCommand cmd = new("sp_U_Pregunta", sqlConnection) {
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.AddWithValue("@idPregunta", pregunta.IdPregunta);
            cmd.Parameters.AddWithValue("@nombre", WC.GetTrim(pregunta.Nombre));            

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try {
                await sqlConnection.OpenAsync();
                await cmd.ExecuteNonQueryAsync();

                response.Info = cmd.Parameters["@info"].Value.ToString();
                response.Error = Convert.ToInt16(cmd.Parameters["@error"].Value.ToString());

            } catch (Exception ex) {
                response.Info = ex.Message;
                response.Error = 1;
            } finally {
                await sqlConnection.CloseAsync();
            }

            return response;
        }

        public async Task<Response> DeletePregunta(int idPregunta) {
            Response response = new();

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());
            SqlCommand cmd = new("sp_D_Pregunta", sqlConnection) {
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.AddWithValue("@idPregunta", idPregunta);

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try {
                await sqlConnection.OpenAsync();
                await cmd.ExecuteNonQueryAsync();

                response.Info = cmd.Parameters["@info"].Value.ToString();
                response.Error = Convert.ToInt16(cmd.Parameters["@error"].Value.ToString());

            } catch (Exception ex) {
                response.Info = ex.Message;
                response.Error = 1;
            } finally {
                await sqlConnection.CloseAsync();
            }

            return response;
        }

    }
}
