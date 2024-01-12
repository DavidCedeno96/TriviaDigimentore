using System.Data.SqlClient;
using System.Data;
using WebApiRest.Models;
using WebApiRest.Utilities;
using Microsoft.Extensions.Options;

namespace WebApiRest.Data
{
    public class SalaJuegoData
    {
        private readonly Conexion conexion = new();

        public async Task<SalaJuegoList> GetSalaJuegoList(int idSala, int idJugador)
        {
            SalaJuegoList list = new()
            {
                Lista = new()
            };
            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());

            SqlCommand cmd = new("sp_B_SalaJuego", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@idSala", idSala);
            cmd.Parameters.AddWithValue("@idJugador", idJugador);

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try
            {
                await sqlConnection.OpenAsync();
                SqlDataReader dr = await cmd.ExecuteReaderAsync();
                while (await dr.ReadAsync())
                {
                    list.Lista.Add(new SalaJuego()
                    {
                        IdSala = Convert.ToInt32(dr["idSala"].ToString()),
                        IdJugador = Convert.ToInt32(dr["idJugador"].ToString()),
                        Nombre = dr["nombre"].ToString(),
                        Iniciales = dr["iniciales"].ToString(),
                        Posicion = Convert.ToInt32(dr["posicion"].ToString()),
                        EstadoJuego = Convert.ToInt32(dr["estadoJuego"].ToString()),
                    });
                }
                await dr.NextResultAsync();

                list.Info = WC.GetSatisfactorio();
                list.Error = 0;

            }
            catch (Exception ex)
            {
                list.Info = ex.Message;
                list.Error = 1;
                list.Lista = null;
            }
            finally
            {
                await sqlConnection.CloseAsync();
            }

            return list;
        }

        public async Task<SalaJuegoList> GetSalaJuegoListByIds(int idSala, int idJugador)
        {
            SalaJuegoList list = new()
            {
                Lista = new()
            };
            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());

            SqlCommand cmd = new("sp_B_SalaJuegoByIds", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@idSala", idSala);
            cmd.Parameters.AddWithValue("@idJugador", idJugador);

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try
            {
                await sqlConnection.OpenAsync();
                SqlDataReader dr = await cmd.ExecuteReaderAsync();
                while (await dr.ReadAsync())
                {
                    list.Lista.Add(new SalaJuego()
                    {
                        IdSala = Convert.ToInt32(dr["idSala"].ToString()),
                        IdJugador = Convert.ToInt32(dr["idJugador"].ToString()),
                        Nombre = dr["nombre"].ToString(),
                        Iniciales = dr["iniciales"].ToString(),
                        Posicion = Convert.ToInt32(dr["posicion"].ToString()),
                        EstadoJuego = Convert.ToInt32(dr["estadoJuego"].ToString()),
                    });
                }
                await dr.NextResultAsync();

                list.Info = WC.GetSatisfactorio();
                list.Error = 0;

            }
            catch (Exception ex)
            {
                list.Info = ex.Message;
                list.Error = 1;
                list.Lista = null;
            }
            finally
            {
                await sqlConnection.CloseAsync();
            }

            return list;
        }

        public async Task<Response> CreateSalaJuego(SalaJuego juego)
        {
            Response response = new();

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());
            SqlCommand cmd = new("sp_C_SalaJuego", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.AddWithValue("@idSala", juego.IdSala);
            cmd.Parameters.AddWithValue("@idJugador", juego.IdJugador);
            cmd.Parameters.AddWithValue("@iniciales", WC.GetTrim(juego.Iniciales));

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try
            {
                await sqlConnection.OpenAsync();
                await cmd.ExecuteNonQueryAsync();

                response.Info = cmd.Parameters["@info"].Value.ToString();
                response.Error = Convert.ToInt16(cmd.Parameters["@error"].Value.ToString());

            }
            catch (Exception ex)
            {
                response.Info = ex.Message;
                response.Error = 1;
            }
            finally
            {
                await sqlConnection.CloseAsync();
            }

            return response;
        }

        public async Task<Response> UpdateSalaJuego(SalaJuego juego)
        {
            Response response = new();

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());
            SqlCommand cmd = new("sp_U_SalaJuego", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.AddWithValue("@idSala", juego.IdSala);
            cmd.Parameters.AddWithValue("@idJugador", juego.IdJugador);
            cmd.Parameters.AddWithValue("@estadoJuego", juego.EstadoJuego);

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try
            {
                await sqlConnection.OpenAsync();
                await cmd.ExecuteNonQueryAsync();

                response.Info = cmd.Parameters["@info"].Value.ToString();
                response.Error = Convert.ToInt16(cmd.Parameters["@error"].Value.ToString());

            }
            catch (Exception ex)
            {
                response.Info = ex.Message;
                response.Error = 1;
            }
            finally
            {
                await sqlConnection.CloseAsync();
            }

            return response;
        }
    }
}
